root="$PWD"
patches=(
    'build chromium_build.patch'
    'vendor/cm chromium_vendor_cm.patch'
    'frameworks/webview chromium_frameworks_webview.patch'
)

function patch {
    count=0

    while [ "x${patches[count]}" != "x" ]; do
        curr="${patches[count]}"
        patch=`echo "$curr" | awk '{print $2}'`
        folder=`echo "$curr" | awk '{print $1}'`

        cd "$folder"

        if [ "$1" = "apply" ]; then
            git am "$root/$patch"
        elif [ "$1" = "reset" ]; then
            git reset --hard github/cm-11.0
        fi

        cd "$root"

        count=$(( $count + 1 ))
    done
}

patch reset

repo sync -f -j12
vendor/cm/get-prebuilts

patch apply
