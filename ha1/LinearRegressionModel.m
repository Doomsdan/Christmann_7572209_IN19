classdef LinearRegressionModel < matlab.mixin.SetGet
    %LINEARREGRESSIONMODEL 
    % Class representing an implementation of linear regression model
    
    properties (Access = public)
        optimizer
        trainingData
        theta
        thetaOptimum
    end
    
    methods (Access = public)
        function obj = LinearRegressionModel(varargin)
            %LINEARREGRESSIONMODEL Construct an instance of this class
            
           for i = 1:nargin
            if ischar(varargin{i}) && strcmp(varargin{i},'Data')
                obj.trainingData = varargin{i+1};
            elseif ischar(varargin{i}) && strcmp(varargin{i},'Optimizer')
                obj.optimizer = varargin{i+1};
            end
            end
            % perform the varargin
            
            obj.initializeTheta();
        end
        
        function J = costFunction(obj)
            m = obj.trainingData.numOfSamples; 
            h = obj.hypothesis();
            
            J = 1/(2*m)* sum((h - obj.trainingData.commandVar).^2);
            
          
            % calculates the cost with the current set of thetas
            
        end
        
        function hValue = hypothesis(obj)
            X = [ones(obj.trainingData.numOfSamples,1) obj.trainingData.feature];
            
            hValue = X * obj.theta;
            
          
           % calculates the h-Value with a matrix multiplication
            
        end
        
        
        function h = showOptimumInContour(obj)
            h = figure('Name','Optimum');
            theta0_vals = linspace(50, 150, 100);
            theta1_vals = linspace(0, 2, 100);
            
            fun = @(a,b) calculateCost(a,b);
            
            Z = bsxfun(fun,theta0_vals,theta1_vals);
            
            Z = transpose(Z);
            
            hold on;
            contour(theta0_vals,theta1_vals,Z);
            plot(obj.thetaOptimum(1),obj.thetaOptimum(2),'x', 'MarkerSize', 10, 'MarkerEdgeColor','red', 'LineWidth',2);
            hold off;        
            
            %plots the contour graph
        end 
        
        
<<<<<<< HEAD:ha1/LinearRegressionModel.m
        function Z = calculateCost(obj,A,B)
=======
        function Z = calculateCosts(obj,A,B) % meaningless varnames
>>>>>>> ff49a1e6d6daac5d90eb22e773d83bf741b1566a:LinearRegressionModel.m
        obj.setTheta(A,B);
        Z = obj.costFunction();
        %calculates the cost for a specific theta tupel
        end
        
        function h = showCostFunctionArea(obj)
            h = figure('Name','Cost Function Area');
            theta0_vals = linspace(50, 150, 100);
            theta1_vals = linspace(0, 2, 100);
           
            
            fun = @(a,b) calculateCost(a,b);
            
            Z = bsxfun(fun,theta0_vals,theta1_vals);
            
            Z = transpose(Z);
            
            surf(Z);
           
            %plots the surface graph
        end
        
        function h = showTrainingData(obj)
           hold on;
           h = figure('Name','Linear Regression Model');
           plot(obj.trainingData.feature,obj.trainingData.commandVar,'rx')
           grid on;
           xlabel(obj.trainingData.featureName + " in Kelvin");
           ylabel(obj.trainingData.commandVarName + " in Kelvin");
           legend('Training Data')
        end
        
        function h = showModel(obj)
            
           h = obj.showTrainingData();
           x = [300 650];
           y = x*obj.thetaOptimum(2) + obj.thetaOptimum(1);
           hold on;
           plot(x,y,'b-');
           hold off;
        end
        
        function setTheta(obj,theta0,theta1)
            obj.theta = [theta0;theta1];
        end
        
        function setThetaOptimum(obj,theta0,theta1)
            obj.thetaOptimum = [theta0;theta1];
        end
    end
    
    methods (Access = private)
        
        function initializeTheta(obj)
            obj.setTheta(0,0);
        end
   
    end
end


