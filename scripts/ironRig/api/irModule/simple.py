import pymel.core as pm
from ... import utils
from ..irSystem import Single
from .module import Module


class Simple(Module):
    def __init__(self, prefix='', joints=[]):
        super(Simple, self).__init__(prefix, joints)

        self.__singleSystem = None

    def singleSystem(self):
        return self.__singleSystem

    def preBuild(self):
        self._buildGroups()
        self._buildInitSkelLocators()
        self._buildInitJoints()

    def _buildInitJoints(self):
        initJoints = []
        for initSkelLoc in self._initSkelLocators:
            initJnt = pm.createNode('joint', n=initSkelLoc.replace('_loc', ''))
            pm.matchTransform(initJnt, initSkelLoc)
            initJnt.segmentScaleCompensate.set(False)
            initJnt.displayLocalAxis.set(True)
            self._initGrp | initJnt
            initJoints.append(initJnt)

        self._initJoints = initJoints

    def _getAimAxisInfo(self):
        pass

    def _buildSystems(self):
        singleJoints = utils.buildNewJoints(self._initJoints, searchStr='init', replaceStr='sg')
        self.__singleSystem = Single(self._prefix+'sg_', singleJoints)
        if self._negateScaleX:
            self.__singleSystem.negateSclaeX = True
        self.__singleSystem.build()
        self.addSystems(self.__singleSystem)

    def _connectSystems(self):
        pass

    def _connectOutputs(self):
        for sysJnt, outJnt in zip(self.__singleSystem.joints(), self._outJoints):
            pm.pointConstraint(sysJnt, outJnt, mo=True)
            pm.orientConstraint(sysJnt, outJnt, mo=True)
            utils.connectTransform(sysJnt, outJnt, ['scale'], ['X', 'Y', 'Z'])

    def _connectSkeleton(self):
        for outJnt, skelJnt in zip(self._outJoints, self._skelJoints):
            pm.parentConstraint(outJnt, skelJnt, mo=True)
            utils.connectTransform(outJnt, skelJnt, ['scale'], ['X', 'Y', 'Z'])
