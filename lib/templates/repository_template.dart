class ModuleRepository {
  Future<List<String>?> getData() async {
    try {
      return ['Captain America', 'Spiderman', 'Thor'];
    } catch (e) {
      print(e.toString());
      return null;
    }
 
  }
}
