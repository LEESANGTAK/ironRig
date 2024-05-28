from maya.api import OpenMaya as om
from maya import cmds
from ... import decorators
from ... import utils
from .plane import Plane


class Aligner(object):
    @staticmethod
    def alignJointsToPlane(joints):
        if len(joints) < 3:
            cmds.warning('The number of joints have to be more than 3.')
            return

        startPoint = utils.getWorldPoint(joints[0])
        midPoint = utils.getWorldPoint(joints[len(joints)/2])
        endPoint = utils.getWorldPoint(joints[-1])

        planeObj = Plane([startPoint, midPoint, endPoint])
        for jnt in joints:
            jntPoint = utils.getWorldPoint(jnt)
            closestPointOnPlane = planeObj.getClosestPoint(jntPoint)
            cmds.xform(jnt, t=closestPointOnPlane, ws=True)

    @staticmethod
    def orientJoints(chainJoints, upVector=None, mirror=True):
        # Store hierarchy information
        parentInfo = {}
        for joint in chainJoints:
            parentInfo[joint] = joint.getParent()

        # Destroy hierarchy
        for joint in chainJoints:
            cmds.parent(joint, w=True)

        for index, joint in enumerate(chainJoints):
            if joint == chainJoints[-1]:  # Skip the end joint
                break

            curJntPoint = utils.getWorldPoint(joint)
            childJntPoint = utils.getWorldPoint(chainJoints[index+1])

            aimVec = childJntPoint - curJntPoint

            # Determine the up vector
            if not upVector:
                if index == 0:
                    if len(chainJoints) <= 2:
                        upVec = om.MVector.kZaxisVector
                        if utils.isParallel(aimVec, upVec):
                            upVec = om.MVector.kXnegAxisVector
                    else:
                        grandChildJntPoint = utils.getWorldPoint(chainJoints[index+2])
                        upVec = Aligner.getUpVector(curJntPoint, childJntPoint, grandChildJntPoint)
                else:
                    parentJntPoint = utils.getWorldPoint(chainJoints[index-1])
                    upVec = Aligner.getUpVector(parentJntPoint, curJntPoint, childJntPoint)
            else:
                upVec = upVector

            # Build matrix
            perpVec = upVec ^ aimVec
            upVec = aimVec ^ perpVec

            aimVec.normalize()
            upVec.normalize()
            perpVec.normalize()

            if mirror:
                if round(utils.getWorldPoint(chainJoints[0]).x) < 0.0:  # Check a joint chain is placed in right side
                    aimVec *= -1
                    upVec *= -1

            jntMatrix = [
                aimVec.x, aimVec.y, aimVec.z, 0.0,
                perpVec.x, perpVec.y, perpVec.z, 0.0,
                upVec.x, upVec.y, upVec.z, 0.0,
                curJntPoint.x, curJntPoint.y, curJntPoint.z, 1.0
            ]

            cmds.xform(joint, matrix=jntMatrix, ws=True)

        # Restore hierarchy
        for joint, parent in parentInfo.items():
            cmds.parent(joint, parent)

        # Orient end joint
        endJoint = chainJoints[-1]
        endJoint.jointOrient.set(0, 0, 0)
        endJoint.rotate.set(0, 0, 0)

        # Transfer rotate values to the orient value
        cmds.makeIdentity(chainJoints[0], apply=True)

    @staticmethod
    @decorators.undoAtOnce
    def alignSelectedJointsOnPlane():
        jnts = cmds.ls(type='joint')
        Aligner.alignJointsToPlane(jnts)

    @staticmethod
    @decorators.undoAtOnce
    def orientSelectedJoints():
        jnts = cmds.ls(type='joint')
        Aligner.orientJoints(jnts)

    @staticmethod
    def orientJointsWithGeo(joints, geo):
        pass

    @staticmethod
    def getUpVector(parentPoint, currentPoint, childPoint):
        upVector = om.MVector()

        aimVector = childPoint - currentPoint
        negAimVector = parentPoint - currentPoint

        perpVector = negAimVector ^ aimVector
        upVector = aimVector ^ perpVector

        # Up vector can be zero vector when aimVector and negAimVector is parallel
        if utils.isParallel(aimVector, negAimVector):
            upVector = om.MVector.kZaxisVector

        # In case of up vector same as aim vector
        if utils.isParallel(aimVector, upVector):
            upVector = om.MVector.kXnegAxisVector

        upVector.normalize()
        return upVector
