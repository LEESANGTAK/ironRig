import pymel.core as pm


class Plane(object):
    def __init__(self, points):
        self.__points = points
        self.__normal = self.__getNormal()

    def getClosestPoint(self, sourcePoint):
        closestPoint = pm.dt.Point()

        # Decide sign depend on direction between normal and toSourcePoint vector
        planePointToSourcePoint = sourcePoint - self.__points[0]
        sign = 1
        if (self.__normal * planePointToSourcePoint) > 1:
            sign = -1
        rayVector = self.__normal * sign  # Ray vector is signed normal vector
        sourceToPlanePointVector = self.__points[0] - sourcePoint
        closestPoint = sourcePoint + ( ( (sourceToPlanePointVector * self.__normal) / (rayVector * self.__normal) ) * rayVector  )

        return closestPoint

    def __getNormal(self):
        normal = pm.dt.Vector()

        pnt0ToEndPntVector = self.__points[-1] - self.__points[0]
        pnt0ToMidPntVector = self.__points[len(self.__points)/2] - self.__points[0]
        normal = pnt0ToEndPntVector ^ pnt0ToMidPntVector
        normal.normalize()

        return normal
