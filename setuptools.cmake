#
# Install setuptools from source
#

if (NOT setuptools_NAME)

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

include (python)

external_source (setuptools
    0.6c11
    setuptools-0.6c11.tar.gz
    7df2a529a074f613b509fb44feefe74e
    http://pypi.python.org/packages/source/s/setuptools)


# Download and install setuptools
message ("Installing ${setuptools_NAME} into FlyEM build area: ${BUILDEM_DIR} ...")

ExternalProject_Add(${setuptools_NAME}
    DEPENDS             ${python_NAME}
    PREFIX              ${BUILDEM_DIR}
    URL                 ${setuptools_URL}
    URL_MD5             ${setuptools_MD5}
    UPDATE_COMMAND      ""
    PATCH_COMMAND       ""
    CONFIGURE_COMMAND   ""
    BUILD_COMMAND       ${BUILDEM_ENV_STRING} ${PYTHON_EXE} setup.py install
    BUILD_IN_SOURCE     1
    INSTALL_COMMAND     ""
)

set_target_properties(${setuptools_NAME} PROPERTIES EXCLUDE_FROM_ALL ON)

endif (NOT setuptools_NAME)