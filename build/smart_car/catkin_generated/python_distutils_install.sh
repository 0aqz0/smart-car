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
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/aqz/smart-car/src/smart_car"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/aqz/smart-car/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/aqz/smart-car/install/lib/python2.7/dist-packages:/home/aqz/smart-car/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/aqz/smart-car/build" \
    "/usr/bin/python" \
    "/home/aqz/smart-car/src/smart_car/setup.py" \
    build --build-base "/home/aqz/smart-car/build/smart_car" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/aqz/smart-car/install" --install-scripts="/home/aqz/smart-car/install/bin"
