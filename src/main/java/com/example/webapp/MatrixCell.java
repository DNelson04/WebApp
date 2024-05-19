package com.example.webapp;

public class MatrixCell{
        private double probability;
        private int weight;

        public MatrixCell(double probability, int weight) {
            this.probability = probability;
            this.weight = weight;
        }
        public double getProbability() {
            return probability;
        }
        public int getWeight() {
            return weight;
        }
        public void setWeight(int weight) {
            this.weight = weight;
        }
        public void setProbability(double v) {
            this.probability = v;
        }

    @Override
    public String toString() {
        return  probability + " " + weight + "\t";
    }
}
