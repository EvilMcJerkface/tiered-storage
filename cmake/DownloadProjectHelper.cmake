# Distributed under the OSI-approved MIT License.  See accompanying
# file LICENSE or https://github.com/Crascit/DownloadProject for details.

CMAKE_MINIMUM_REQUIRED(VERSION 3.6)

project(${DL_ARGS_PROJ}-download NONE)

include(ExternalProject)
ExternalProject_Add(${DL_ARGS_PROJ}-download
                    ${DL_ARGS_UNPARSED_ARGUMENTS}
                    SOURCE_DIR          "${DL_ARGS_SOURCE_DIR}"
                    BINARY_DIR          "${DL_ARGS_BINARY_DIR}"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
)