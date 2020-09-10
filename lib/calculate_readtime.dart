Map calculateReadTime(String text) {
  var words = text.split(RegExp(r'(\s+)'));
  var magicalNumber = words.length / 200;
  return {
    'seconds': words.length == 1 && words[0] == ''
        ? 0
        : ((magicalNumber - magicalNumber.truncate()) * 0.6 * 100).ceil(),
    'minutes': magicalNumber.truncate(),
    'words': words.length == 1 && words[0] == '' ? 0 : words.length
  };
}
