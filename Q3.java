class Qn3 {
  void pascal(int N) {
    // total of N arrays
    // length of arrays: 1, 2, ..., N
    
    HashMap<Integer, ArrayList<Integer>> hm = new HashMap<>;
    // hm stores the N arrays
    for (int i = 1; i <= N; i++) {
      hm.put(i, new ArrayList<Integer>); // key = row number, value = arraylist of the numbers in that row
    }
    
    hm.get(1).add(1); // set 1st row to 1;
    print(firstRow + "/n");
    for (int j = 2; j <= N;  j++) {
      // jth row
      hm.get(j).add(1); // 1st ele set to 1
      print(1);
      Integer[] prevRow = hm.get(j - 1);
      for (k = 1; k < prevRow.length; k++) {
        int sum = prevRow.get(k - 1) + prevRow.get(k);
        hm.get(j).add(sum);
        print(sum);
      }
      hm.get(j).add(1); // last ele set to 1
      print(1 + "\n");
    } 
  }
}
