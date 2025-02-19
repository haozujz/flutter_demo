class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  final TrieNode root = TrieNode();

  void insert(String word) {
    TrieNode node = root;
    for (var char in word.split('')) {
      node.children.putIfAbsent(char, () => TrieNode());
      node = node.children[char]!;
    }
    node.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode? node = _findNode(word);
    return node != null && node.isEndOfWord;
  }

  bool startsWith(String prefix) {
    return _findNode(prefix) != null;
  }

  List<String> getWordsWithPrefix(String prefix) {
    TrieNode? node = _findNode(prefix);
    if (node == null) return [];

    List<String> results = [];
    _collectWords(node, prefix, results);
    return results;
  }

  TrieNode? _findNode(String prefix) {
    TrieNode node = root;
    for (var char in prefix.split('')) {
      if (!node.children.containsKey(char)) return null;
      node = node.children[char]!;
    }
    return node;
  }

  void _collectWords(TrieNode node, String prefix, List<String> results) {
    if (node.isEndOfWord) {
      results.add(prefix);
    }
    for (var entry in node.children.entries) {
      _collectWords(entry.value, prefix + entry.key, results);
    }
  }
}
