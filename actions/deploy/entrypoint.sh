#!/bin/sh
# vi: se et:

echo "::add-mask::$APIKEY"
echo "::warning ::nais/deploy/actions/deploy@v1 is deprecated and will stop working in the future. Update your workflow as per https://doc.nais.io/build/how-to/build-and-deploy"

if [ -z "$OWNER" ]; then
    export OWNER=`echo $GITHUB_REPOSITORY | cut -f1 -d/`
fi

if [ -z "$REPOSITORY" ]; then
    export REPOSITORY=`echo $GITHUB_REPOSITORY | cut -f2 -d/`
fi

if [ -z "$REF" ]; then
    export REF="$GITHUB_REF"
fi

if [ -z "$WAIT" ]; then
    export WAIT="true"
fi

# Inject "image" as a template variable to a new copy of the vars file.
# If the file doesn't exist, it is created. The original file is left untouched.
if [ ! -z "$IMAGE" ]; then
    export VARS_ORIGINAL="$VARS"
    export VARS=`mktemp`
    if [ -z "$VARS_ORIGINAL" ]; then
        echo "---" > $VARS
    else
        cat $VARS_ORIGINAL > $VARS
    fi
    yq w --inplace $VARS image "$IMAGE"
fi

export ACTIONS="true"

/app/deploy
