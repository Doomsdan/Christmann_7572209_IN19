classdef GradientDescentOptimizer < matlab.mixin.SetGet
    %GRADIENTDESCENTOPTIMIZER 
    % Class to perform the training for a lineare regression Model
      
    properties (Access = private)
        costHistory
        learningRate
        maxIterations
    end
    
    methods (Access = public)
        function obj = GradientDescentOptimizer(varargin)
            %GRADIENTDESCENTOPTIMIZER Construct an instance of this class            
          for i = 1:nargin
            if ischar(varargin{i}) && strcmp(varargin{i},'LearningRate')
                obj.learningRate = varargin{i+1};
            elseif ischar(varargin{i}) && strcmp(varargin{i},'MaxIterations')
                obj.maxIterations = varargin{i+1};
            end
         end
            % perform the varargin
            
        end

        function h = runTraining(obj, linearRegressionModel)
            [alpha,maxIters,theta,X,y,m,costOverIters] = obj.getLocalsForTraining(linearRegressionModel);
                      
           for  v = 1:maxIters
               h =  X * theta ;
               t1 = theta(1) - alpha *( 1/m ) * sum( h-y );
               t2 = theta(2) - alpha *( 1/m ) * sum(( h-y ).* X(:,2));
               theta(1) = t1;
               theta(2) = t2;
               test = linearRegressionModel.costFunction();
               linearRegressionModel.setTheta(t1,t2);
               costOverIters(v) = test; 
           end 
               
               
            
            obj.costHistory = costOverIters;
            linearRegressionModel.setThetaOptimum(theta(1),theta(2));
            h = obj.showTrainingResult();
            
            %The actual training of the model
        end
        
        function h = showTrainingResult(obj)
           h = figure('Name','Costs over Iterations during training');
           plot(obj.costHistory,'x-');
           xlabel('Iterations'); ylabel('costs');
           grid on;
           xlim([2500 obj.maxIterations]);
        end
        
        function setLearningRate(obj, alpha)
           obj.learningRate = alpha;
        end
        
        function setMaxNumOfIterations(obj, maxIters)
            obj.maxIterations = maxIters;
        end
    
    end
    
    methods (Access = private) 
       function [alpha,maxIters,theta,X,y,m,costOverIters] = getLocalsForTraining(obj,linearRegressionModel)
            m = linearRegressionModel.trainingData.numOfSamples;
            theta = linearRegressionModel.theta;
            X = [ones(m,1) linearRegressionModel.trainingData.feature];
            alpha = obj.learningRate;
            y = linearRegressionModel.trainingData.commandVar;
            costOverIters = zeros(obj.maxIterations, 1);
            maxIters = obj.maxIterations;
        end 
    end
end

