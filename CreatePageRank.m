pr_matrix = load('CollegeMsg.mat');
pr_matrix = pr_matrix.Problem.A;
% Antikatastasi sthlwn pou exoun mhdenika stoixeia me to dianusma 
% (1/n 1/n ... 1/n)^T
for i=1:length(pr_matrix)
    if(pr_matrix(:,i) == 0)
        pr_matrix(:,i) = 1/length(pr_matrix);
    end
end

% Creating the page rank
p = 0.85;
n = length(pr_matrix);
G = pr_matrix;
c = sum(G,1);
k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);
e = ones(n,1);
I = speye(n,n);
delta = ((1-p)/n);
x = (I - p*G*D)\(delta*e);
x = x/sum(x);

% Create a top 20 ranking 
[sortedx, node] = sort(x, 'descend');
T = table(node(1:20), sortedx(1:20));
T.Properties.VariableNames = {'node','PR_value'};

% Calculate k = I - p*G*D for different values of p
pvalues = [0.25 0.45 0.65 0.85 0.95 0.99];
for i = 1:6
    condition_number(i) = cond((I - pvalues(i)*G*D), inf);
end
condition_number