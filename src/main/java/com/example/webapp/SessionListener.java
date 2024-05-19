package com.example.webapp;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Arrays;

public class SessionListener implements HttpSessionListener {
    Logger logger = LogManager.getLogger("WebApp");
    public void sessionCreated(HttpSessionEvent se) {}
    public void sessionDestroyed(HttpSessionEvent se) {
        logger.info("Session destroyed: {}", se.getSession().getId());
        HttpSession session = se.getSession();
        MatrixCell[][] sessionMatrix = (MatrixCell[][])session.getAttribute("matrix");
        if (sessionMatrix != null) {
            StringBuilder mainInfo = new StringBuilder();
            StringBuilder sessionInfo = new StringBuilder();
            MatrixCell[][] mainMatrix = MarkovMatrix.getMatrix();
            for(int i = 0; i < sessionMatrix.length; i++) {
                for(int j = 0; j < sessionMatrix[i].length; j++) {
                    mainInfo.append(mainMatrix[i][j]);
                    sessionInfo.append(sessionMatrix[i][j]);
                }
                mainInfo.append("\n");
                sessionInfo.append("\n");
            }
            logger.info("Main Matrix info: \n{}", mainInfo.toString());
            logger.info("Session Matrix info: \n{}:", sessionInfo.toString());
            MarkovMatrix.combineMatrices(mainMatrix, sessionMatrix);
            MarkovMatrix.saveMatrix(mainMatrix);
        }
    }
}
