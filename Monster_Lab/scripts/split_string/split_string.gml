function split_string(msg, splitBy){
	var slot = 0;
	var splits; //array to hold all splits
	var str2 = ""; //var to hold the current split we're working on building

	var i;
	for (i = 1; i < (string_length(msg)+1); i++) {
		var currStr = string_copy(msg, i, 1);
		if (currStr == splitBy) {
			splits[slot] = str2; //add this split to the array of all splits
			slot++;
			str2 = "";
		} else {
			str2 = str2 + currStr;
			splits[slot] = str2;
		}
	}
	//removes \r\n from end of line
	if(string_count("\r\n", splits[slot]) > 0){
		splits[slot] = splits[slot]
	}
	return(splits)
}