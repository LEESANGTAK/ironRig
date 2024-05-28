

class Plane(object):
    def __init__(self, points):
        self._points = points
        self._normal = self._getNormal()

    def getClosestPoint(self, sourcePoint):
        # Decide sign depend on direction between normal and toSourcePoint vector
        planePointToSourcePoint = sourcePoint - self._points[0]
        sign = 1
        if (self._normal * planePointToSourcePoint) > 1:
            sign = -1
        rayVector = self._normal * sign  # Ray vector is that signed normal vector
        sourceToPlanePointVector = self._points[0] - sourcePoint
        closestPoint = sourcePoint + ( ( (sourceToPlanePointVector * self._normal) / (rayVector * self._normal) ) * rayVector  )
        return closestPoint

    def _getNormal(self):
        pnt0ToEndPntVector = self._points[-1] - self._points[0]
        pnt0ToMidPntVector = self._points[len(self._points)/2] - self._points[0]
        normal = pnt0ToEndPntVector ^ pnt0ToMidPntVector
        normal.normalize()
        return normal
