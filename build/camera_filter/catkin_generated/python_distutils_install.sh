#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/crumb/MEHATRONIKA/project_ws/src/camera_filter"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/crumb/MEHATRONIKA/project_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/crumb/MEHATRONIKA/project_ws/install/lib/python3/dist-packages:/home/crumb/MEHATRONIKA/project_ws/build/camera_filter/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/crumb/MEHATRONIKA/project_ws/build/camera_filter" \
    "/usr/bin/python3" \
    "/home/crumb/MEHATRONIKA/project_ws/src/camera_filter/setup.py" \
     \
    build --build-base "/home/crumb/MEHATRONIKA/project_ws/build/camera_filter" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/crumb/MEHATRONIKA/project_ws/install" --install-scripts="/home/crumb/MEHATRONIKA/project_ws/install/bin"
