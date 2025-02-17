package ex1;

class BubbleSort implements SortingStrategy {
    public void sort(Phone[] phones) {
        int n = phones.length;
        Phone temp;
        for (int i = 0; i < n; i++) {
            for (int j = 1; j < (n - i); ++j) {
                if (phones[j - 1].getPrice() > phones[j].getPrice()) {
                    // swap elements
                    temp = phones[j - 1];
                    phones[j - 1] = phones[j];
                    phones[j] = temp;
                }
            }
        }
    }
}

class InsertionSort implements SortingStrategy {
    public void sort(Phone[] phones) {
        int n = phones.length;
        Phone temp;
        for (int i = 1; i < n; ++i) {
            temp = phones[i];
            int j = i - 1;
            while (j >= 0 && phones[j].getPrice() > temp.getPrice()) {
                phones[j + 1] = phones[j];
                j = j - 1;
            }
            phones[j + 1] = temp;
        }
    }
}

class SelectionSort implements SortingStrategy {
    public void sort(Phone[] phones) {
        int n = phones.length;
        Phone temp;
        for (int i = 0; i < n - 1; i++) {
            int min_idx = i;
            for (int j = i + 1; j < n; ++j) {
                if (phones[j].getPrice() < phones[min_idx].getPrice()) {
                    min_idx = j;
                }
            }
            temp = phones[min_idx];
            phones[min_idx] = phones[i];
            phones[i] = temp;
        }
    }
}