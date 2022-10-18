# -*- coding: utf-8 -*-

from ...utils import eigh
try:
    from maya import cmds
    from maya import OpenMaya
except:
    pass


class OBB(object):
    """
    :class:`OBB` Oriented Bounding Box Class.

    Requires an input meshName.
    """
    meshName = None

    def __init__(self, meshName=None):

        if not meshName:
            raise RuntimeError("No mesh set in class.")

        self.shapeName = self.getShape(meshName)
        self.fnMesh = self.getMFnMesh(self.shapeName)

        # Get data we need to calculate OBB.
        self.points = self.getPoints(self.fnMesh)

        eigenVectors, center, obb_extents = self.build_from_points()

        # Naturally aligned axis for x, y, z.
        self.eigenVectors = eigenVectors

        # Center point.
        self._center = center

        # Extents (length) of the bounding in x, y, z.
        self._obb_extents = obb_extents

        self.boundPoints = self.get_bounding_points()

        self._width = (self.boundPoints[1] - self.boundPoints[0]).length()
        self._height = (self.boundPoints[2] - self.boundPoints[0]).length()
        self._depth = (self.boundPoints[6] - self.boundPoints[0]).length()
        self._matrix = self.getMatrix()

    @property
    def width(self):
        """
        Property width of the bounding box.
        """
        return self._width

    @property
    def height(self):
        """
        Property height of the bounding box.
        """
        return self._height

    @property
    def depth(self):
        """
        Property depth of the bounding box.
        """
        return self._depth

    @property
    def volume(self):
        """
        Property volume of bounding box.
        """
        return self._width * self._height * self._depth

    @property
    def matrix(self):
        """
        Property matrix of the bounding box.
        """
        return self._matrix

    @property
    def center(self):
        """
        Property center of the bounding box.

        Returns:
            (OpenMaya.MVector)
        """
        return self._center

    @classmethod
    def from_points(cls, meshName=None):
        """
        Bounding box algorithm using vertex points.

        Raises:
            None

        Returns:
            (OBB Instance)
        """
        return cls(meshName=meshName)

    def create_bounding_box(self, meshName="bounding_GEO"):
        """
        Create the bounding box mesh.

        :param meshName(string): Name of created mesh.

        Raises:
            None

        Returns:
            (string) Cube Transform
        """
        obbCube = cmds.polyCube(constructionHistory=False, name="obb_GEO")[0]

        for ind, pnt in enumerate(self.boundPoints):
            cmds.xform("%s.vtx[%s]" % (obbCube, ind),
                       translation=[pnt.x, pnt.y, pnt.z])

        return obbCube

    def getMatrix(self):
        """
        Gets the matrix representing the transformation of the bounding box.

        Raises:
            None

        Returns:
            (list of floats) Matrix
        """
        m = [(self.eigenVectors[1].x * self._obb_extents.y * 2),
             (self.eigenVectors[1].y * self._obb_extents.y * 2),
             (self.eigenVectors[1].z * self._obb_extents.y * 2),
             0.0,
             (self.eigenVectors[2].x * self._obb_extents.z * 2),
             (self.eigenVectors[2].y * self._obb_extents.z * 2),
             (self.eigenVectors[2].z * self._obb_extents.z * 2),
             0.0,
             (self.eigenVectors[0].x * self._obb_extents.x * 2),
             (self.eigenVectors[0].y * self._obb_extents.x * 2),
             (self.eigenVectors[0].z * self._obb_extents.x * 2),
             0.0,
             self._center.x,
             self._center.y,
             self._center.z,
             1.0]

        # Get the scale.
        mMat = OpenMaya.MMatrix()
        OpenMaya.MScriptUtil.createMatrixFromList(m, mMat)

        if mMat.det4x4() < 0:
            m[8] *= -1
            m[9] *= -1
            m[10] *= -1

        return m

    def getBottomPoints(self):
        bottomPnts = []
        matrixXVec = OpenMaya.MVector(self._matrix[0], self._matrix[1], self._matrix[2])
        for pnt in self.boundPoints:
            centerToPntVec = pnt - self._center
            if matrixXVec * centerToPntVec < 0:
                bottomPnts.append(OpenMaya.MPoint(pnt))
        return bottomPnts

    def getTopPoints(self):
        topPnts = []
        matrixXVec = OpenMaya.MVector(self._matrix[0], self._matrix[1], self._matrix[2])
        for pnt in self.boundPoints:
            centerToPntVec = pnt - self._center
            if matrixXVec * centerToPntVec > 0:
                topPnts.append(OpenMaya.MPoint(pnt))
        return topPnts

    def get_bounding_points(self):
        """
        Gets the bounding box points from the build.

        Raises:
            None

        Returns:
            (list of MVectors) Bounding box points.
        """
        boundPoints = [(self._center - self.eigenVectors[0] *
                        self._obb_extents.x + self.eigenVectors[1] *
                        self._obb_extents.y + self.eigenVectors[2] *
                        self._obb_extents.z),
                       (self._center - self.eigenVectors[0] *
                        self._obb_extents.x + self.eigenVectors[1] *
                        self._obb_extents.y - self.eigenVectors[2] *
                        self._obb_extents.z),
                       (self._center + self.eigenVectors[0] *
                        self._obb_extents.x + self.eigenVectors[1] *
                        self._obb_extents.y + self.eigenVectors[2] *
                        self._obb_extents.z),
                       (self._center + self.eigenVectors[0] *
                        self._obb_extents.x + self.eigenVectors[1] *
                        self._obb_extents.y - self.eigenVectors[2] *
                        self._obb_extents.z),
                       (self._center + self.eigenVectors[0] *
                        self._obb_extents.x - self.eigenVectors[1] *
                        self._obb_extents.y + self.eigenVectors[2] *
                        self._obb_extents.z),
                       (self._center + self.eigenVectors[0] *
                        self._obb_extents.x - self.eigenVectors[1] *
                        self._obb_extents.y - self.eigenVectors[2] *
                        self._obb_extents.z),
                       (self._center - self.eigenVectors[0] *
                        self._obb_extents.x - self.eigenVectors[1] *
                        self._obb_extents.y + self.eigenVectors[2] *
                        self._obb_extents.z),
                       (self._center - self.eigenVectors[0] *
                        self._obb_extents.x - self.eigenVectors[1] *
                        self._obb_extents.y - self.eigenVectors[2] *
                        self._obb_extents.z)]

        return boundPoints

    def build_from_points(self):
        """
        Bounding box algorithm using vertex points.

        Raises:
            None

        Returns:
            EigenVectors(OpenMaya.MVector)
            CenterPoint(OpenMaya.MVector)
            BoundingExtents(OpenMaya.MVector)
        """
        pointSize = float(self.points.length())

        mu = OpenMaya.MVector(0.0, 0.0, 0.0)
        # Calculate the average position of points.
        for p in range(int(pointSize)):
            mu += self.points[p] / pointSize

        cxx, cxy, cxz, cyy, cyz, czz = 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
        for p in range(int(pointSize)):
            p = self.points[p]
            cxx += p.x * p.x - mu.x * mu.x
            cxy += p.x * p.y - mu.x * mu.y
            cxz += p.x * p.z - mu.x * mu.z
            cyy += p.y * p.y - mu.y * mu.y
            cyz += p.y * p.z - mu.y * mu.z
            czz += p.z * p.z - mu.z * mu.z

        # Covariance Matrix
        C = [[cxx, cxy, cxz],
             [cxy, cyy, cyz],
             [cxz, cyz, czz]]

        return self.build_from_covariance_matrix(
            cvMatrix=C)

    def build_from_covariance_matrix(self, cvMatrix=None):
        """
        Build eigen vectors from covariance matrix.

        :param matrix(list of lists): covariance matrix

        Raises:
            None

        Returns:
            None
        """
        # Calculate the natural axes by getting the eigen vectors.
        eigenValues, eigVec = eigh(cvMatrix)

        r = OpenMaya.MVector(eigVec[0][0], eigVec[1][0], eigVec[2][0])
        r.normalize()

        u = OpenMaya.MVector(eigVec[0][1], eigVec[1][1], eigVec[2][1])
        u.normalize()

        f = OpenMaya.MVector(eigVec[0][2], eigVec[1][2], eigVec[2][2])
        f.normalize()

        minim = OpenMaya.MVector(1e10, 1e10, 1e10)
        maxim = OpenMaya.MVector(-1e10, -1e10, -1e10)

        for i in range(self.points.length()):
            pnt = self.points[i]

            p_prime = OpenMaya.MVector(
                r * pnt, u * pnt, f * pnt)

            minim = OpenMaya.MVector(
                min(minim.x, p_prime.x),
                min(minim.y, p_prime.y),
                min(minim.z, p_prime.z))
            maxim = OpenMaya.MVector(
                max(maxim.x, p_prime.x),
                max(maxim.y, p_prime.y),
                max(maxim.z, p_prime.z))

        centerPoint = (maxim + minim) * .5
        m_ext = (maxim - minim) * .5

        R = OpenMaya.MVector(r.x, u.x, f.x)
        U = OpenMaya.MVector(r.y, u.y, f.y)
        F = OpenMaya.MVector(r.z, u.z, f.z)

        m_pos = OpenMaya.MVector(
            R * centerPoint, U * centerPoint, F * centerPoint)

        return [r, u, f], m_pos, m_ext

    def getPoints(self, fnMesh):
        """
        Get the points of each vertex.

        :param fnMesh (OpenMaya.MFnMesh): mesh function set.

        Raises:
            None

        Returns:
            (OpenMaya.MVectorArray) list of points.
        """
        mPoints = OpenMaya.MPointArray()
        fnMesh.getPoints(mPoints, OpenMaya.MSpace.kWorld)

        mVecPoints = OpenMaya.MVectorArray()
        [mVecPoints.append(OpenMaya.MVector(mPoints[x]))
         for x in range(mPoints.length())]

        return mVecPoints

    def getMFnMesh(self, mesh):
        """
        Gets the MFnMesh of the input mesh.

        :param mesh (str): string name of input mesh.

        Raises:
            `RuntimeError` if not a mesh.
        Returns:
            (OpenMaya.MFnMesh) MFnMesh mesh object.
        """
        mSel = OpenMaya.MSelectionList()
        mSel.add(mesh)

        mDagMesh = OpenMaya.MDagPath()
        mSel.getDagPath(0, mDagMesh)

        try:
            fnMesh = OpenMaya.MFnMesh(mDagMesh)
        except:
            raise RuntimeError("%s is not a mesh.")

        return fnMesh

    def getShape(self,  node):
        """
        Gets the shape node from the input node.

        :param node (str): string name of input node

        Raises:
            `RuntimeError` if no shape node.
        Returns:
            (str) shape node name
        """
        if cmds.nodeType(node) == 'transform':
            shapes = cmds.listRelatives(node, shapes=True)

            if not shapes:
                raise RuntimeError('%s has no shape' % node)

            return shapes[0]

        elif cmds.nodeType(node) == "mesh":
            return node
