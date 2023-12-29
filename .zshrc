function zipsi {
	caller_path=$(pwd)
	# remove the install path assumption
	CALLER_PATH=$caller_path ~/zipsi-utility/proxy.sh $1
}
