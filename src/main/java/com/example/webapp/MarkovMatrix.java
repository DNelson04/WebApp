package com.example.webapp;

import jakarta.servlet.ServletContext;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class MarkovMatrix {
    static String filePath;
    static MatrixCell[][] matrix;
    static Logger logger = LogManager.getLogger("WebApp");

    public static void initializeMatrix(ServletContext context) {
        filePath = context.getRealPath("/markov_matrix.txt");
        matrix = readMarkovMatrixFromFile();
    }

    private static MatrixCell[][] readMarkovMatrixFromFile() {
        try {
            File file = new File(filePath);
            Scanner scanner = new Scanner(file);

            int numRows = scanner.nextInt();
            int numCols = scanner.nextInt();

            MatrixCell[][] matrix = new MatrixCell[numRows][numCols];

            for (int i = 0; i < numRows; i++) {
                for (int j = 0; j < numCols; j++) {
                    if (scanner.hasNext()) {
                        double probability = scanner.nextDouble();
                        int count = scanner.nextInt();
                        matrix[i][j] = new MatrixCell(probability, count);
                    }
                }
            }
            scanner.close();
            return matrix;
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + filePath);
            return null;
        }
    }

    private static void saveMarkovMatrixToFile(MatrixCell[][] matrix) {
        try {
            FileWriter writer = new FileWriter(MarkovMatrix.filePath);
            int numRows = matrix.length;
            int numCols = matrix[0].length;

            writer.write(numRows + " " + numCols + " ");
            StringBuilder info = new StringBuilder();
            info.append("Saved Matrix: ").append("\n");
            for (int i = 0; i < numRows; i++) {
                for (int j = 0; j < numCols; j++) {
                    writer.write(matrix[i][j].toString() + " ");
                    info.append(matrix[i][j]);
                }
                info.append("\n");
            }
            logger.info(info.toString());
            writer.close();
        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
        }
    }

    public static MatrixCell[][] getMatrix() {
        return matrix;
    }

    public static MatrixCell[][] getNewMatrix() {
        MatrixCell[][] newMatrix = new MatrixCell[matrix.length][matrix[0].length];
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                newMatrix[i][j] = new MatrixCell(0,0);
            }
        }
        return newMatrix;
    }
        public static void combineMatrices(MatrixCell[][] mainMatrix, MatrixCell[][] sessionMatrix) {
            int rawValMain;
            int rawValSession;
            int cellWeight;
            double rowWeight = 0;
            StringBuilder combinedWeightString= new StringBuilder("\n");
            for (int i = 0; i < mainMatrix.length; i++) {
                for (int j = 0; j < mainMatrix[0].length; j++) {
                    rowWeight += mainMatrix[i][j].getWeight() + (sessionMatrix[i][j].getWeight());
                }
                for (int j = 0; j < mainMatrix[0].length; j++) {
                    rawValMain = mainMatrix[i][j].getWeight();
                    rawValSession = sessionMatrix[i][j].getWeight();
                    cellWeight = rawValMain+rawValSession;

                    mainMatrix[i][j].setProbability((double) (cellWeight) / rowWeight);
                    mainMatrix[i][j].setWeight(cellWeight);
                    combinedWeightString.append("cell ").append(i).append(",").append(j).append(" = ").append(mainMatrix[i][j].getProbability()).append("\n");
                }
                combinedWeightString.append("\n");
                rowWeight = 0;
            }
            logger.info(combinedWeightString.toString());
        }
        public static void saveMatrix(MatrixCell[][] matrix) {
            try{
                saveMarkovMatrixToFile(matrix);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    public static void updateMatrix(MatrixCell[][] sessionMatrix, int from, int to) {
        // Increment the weight of the specific transition
        sessionMatrix[from][to].setWeight(sessionMatrix[from][to].getWeight() + 1);

        // Calculate the row sum
        int rowSum = 0;
        for (int j = 0; j < sessionMatrix[0].length; j++) {
            rowSum += sessionMatrix[from][j].getWeight();
        }

        // Update the probabilities for the entire row
        for (int j = 0; j < sessionMatrix[0].length; j++) {
            if (rowSum > 0) {
                sessionMatrix[from][j].setProbability((double) sessionMatrix[from][j].getWeight() / rowSum);
            }
        }
    }
}



