if (NOT yapsy_NAME)

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

include (python)
include (setuptools)

external_source (yapsy
    1.10.1
    Yapsy-1.10.1-pythons2n3.tar.gz
    468274aa078bd56a5ab4a41cd6c0c8ef #d41d8cd98f00b204e9800998ecf8427e
    http://pypi.python.org/packages/source/Y/Yapsy
    FORCE)

message ("Installing ${yapsy_NAME} into ilastik build area: ${BUILDEM_DIR} ...")
ExternalProject_Add(${yapsy_NAME}
    DEPENDS             ${python_NAME} ${setuptools_NAME}
    PREFIX              ${BUILDEM_DIR}
    URL                 ${yapsy_URL}
    URL_MD5             ${yapsy_MD5}
    UPDATE_COMMAND      ""
    PATCH_COMMAND       ""
    CONFIGURE_COMMAND   ""
    BUILD_COMMAND       ${BUILDEM_ENV_STRING} ${PYTHON_EXE} setup.py install
    BUILD_IN_SOURCE     1
    TEST_COMMAND        ""
    INSTALL_COMMAND     ""
)

set_target_properties(${yapsy_NAME} PROPERTIES EXCLUDE_FROM_ALL ON)


endif (NOT yapsy_NAME)

