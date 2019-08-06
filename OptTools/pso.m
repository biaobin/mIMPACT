function [x,fval] = pso(problem)

CostFunction = problem.objective;    % Cost Function
nVar         = problem.nVar;

for j = 1:nVar
    VarLimt(j).Min = problem.lb(j);
    VarLimt(j).Max = problem.up(j);
end
                                  % Number of Unknown (Decision) Variables
VarSize = [1 nVar];               % Matrix Size of Decision Variables
%% Parameters of PSO
MaxIt = problem.maxit;      % Maximum Number of Iterations

nPop = problem.np;        % Population Size (Swarm size)

%w = 0.7298;               % Intertia Coefficient
w = 1;
wdamp = 0.99;        % Damping Ratia of Inertia Coefficient 
c1 = 1.4962;              % Personal Acceleration Coefficient
c2 = 1.4962;              % Social Acceleration Coefficient

for j = 1:nVar
    VelocityLimt(j).Max = 0.2*(VarLimt(j).Max-VarLimt(j).Min);
    VelocityLimt(j).Min = - VelocityLimt(j).Max;
end

% The Flag for Showing Iteration Information
ShowIterInfo = true; 
%% Initialization

% The Particle Template
empty_particle.Position = [];
empty_particle.Velocity = [];
empty_particle.Cost = [];
empty_particle.Best.Position = [];
empty_particle.Best.Cost = [];

% Create population Array
particle = repmat(empty_particle,nPop,1);

% if defined probel.previousBestPosition, then set particle(1) as the
% previous result
if isfield(problem,'previousBestPosition')
    % 201906, biaobin, using the previous optimum positions for one particle
    particle(1).Position = problem.previousBestPosition;
    % Initialize Velocity
    particle(1).Velocity = zeros(VarSize);
    % Evaluation
    particle(1).Cost = CostFunction(particle(1).Position);
    % Update the Personal Best
    particle(1).Best.Position = particle(1).Position;
    particle(1).Best.Cost = particle(1).Cost;

    % global best now is the previous best results
    GlobalBest = particle(1).Best;   
    nPop_start = 2;  
else   
    % Initialize Global Best as Inf
    GlobalBest.Cost = Inf;
    nPop_start = 1;
end

% Initialize Population Members for the rest particles
for i = nPop_start:nPop
    % generate initial particle positions
    for j=1:nVar
         %particle(i).Position(j) = unifrnd(VarLimt(j).Min,VarLimt(j).Max);
         particle(i).Position(j) = (VarLimt(j).Max - VarLimt(j).Min)*rand() + VarLimt(j).Min;
    end    
    % Initialize Velocity
    particle(i).Velocity = zeros(VarSize);
    
    % Evaluation
    particle(i).Cost = CostFunction(particle(i).Position);
    
    % Update the Personal Best
    particle(i).Best.Position = particle(i).Position;
    particle(i).Best.Cost = particle(i).Cost;
    
    % Update the Global Best
   if particle(i).Best.Cost < GlobalBest.Cost
       GlobalBest = particle(i).Best;
   end
end

% Array to hold best cost on each iteration 
BestCosts = zeros(MaxIt,1);

%% Main loop of pso
for it = 1:MaxIt
 
    for i=1:nPop
        
        % Update Velocity and Position
        for j=1:nVar
            % Update Velocity
            particle(i).Velocity(j) = w * particle(i).Velocity(j) ...
                + c1*rand*( particle(i).Best.Position(j) - particle(i).Position(j) )...
                + c2*rand*( GlobalBest.Position(j) - particle(i).Position(j) );
            % Apply Velocity Limits
            particle(i).Velocity(j) = max(particle(i).Velocity(j), VelocityLimt(j).Min);
            particle(i).Velocity(j) = min(particle(i).Velocity(j), VelocityLimt(j).Max);

            % Update Position
            particle(i).Position(j) = particle(i).Position(j) + particle(i).Velocity(j);

            % Apply Position Limits
            particle(i).Position(j) = max(VarLimt(j).Min, particle(i).Position(j));
            particle(i).Position(j) = min(VarLimt(j).Max, particle(i).Position(j));
        end
        % Evaluation
        particle(i).Cost = CostFunction( particle(i).Position );

        % Update Personal Best
        if particle(i).Cost < particle(i).Best.Cost
        
            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;            
            
            % Update Global Best
            if particle(i).Best.Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
                
            end
        end
       
    end
    if ShowIterInfo
    % Display Iteration Information
    disp(['Iteration ' num2str(it) ...
          ' Best positon = ' num2str(GlobalBest.Position)]);
    disp([' Best Cost = ' num2str(GlobalBest.Cost) ]);
   

%     disp(['Iteration ' num2str(it) ...
%           ' Best Cost = ' num2str(GlobalBest.Cost)]);
      
    end
    % Store the Best Cost Value
    BestCosts(it) = GlobalBest.Cost;
    
    % Damping Inertia Coefficient
    w = w * wdamp;
     
end

x = GlobalBest.Position;
fval = GlobalBest.Cost;

% %% Results
% figure;
% %plot(BestCosts,'Linewidth',2);
% semilogy(BestCosts,'Linewidth',2);
% xlabel('Iteration'),ylabel('Best Costs');
% grid on

end




