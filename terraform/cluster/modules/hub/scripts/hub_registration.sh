set -e

if [ "$#" -lt 3 ]; then
    >&2 echo "Not all expected arguments set."
    exit 1
fi

CLUSTER_LOCATION=$1
CLUSTER_NAME=$2
SERVICE_ACCOUNT_KEY=$3

#write temp key, cleanup at exit
tmp_file=$(mktemp)
# shellcheck disable=SC2064
trap "rm -rf $tmp_file" EXIT
echo "${SERVICE_ACCOUNT_KEY}" | base64 --decode > "$tmp_file"

gcloud container hub memberships register "${CLUSTER_NAME}" --gke-cluster="${CLUSTER_LOCATION}"/"${CLUSTER_NAME}" --service-account-key-file="${tmp_file}" --quiet

