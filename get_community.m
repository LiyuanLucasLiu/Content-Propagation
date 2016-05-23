function [lables center]= get_community(data, centers , num_clusters)

% This function is modified from:
%   http://scgroup.hpclab.ceid.upatras.gr/scgroup/Projects/TMG/

iter = 0;
qold = inf;
threshold = 0.001;
data= data';   
centers = double(centers);

%
% Calculate the distance (square) between data and centers
%
n = size(data, 1);
x = sum(data.*data, 2)';
X = repmat(x, num_clusters, 1);
y = sum(centers.*centers, 2);
Y = repmat(y, 1, n);
P = X + Y - 2*centers*data';

[~, ind] = min(P, [], 1);
lables = ind';
center= centers;
q=0;

while 1
  iter = iter + 1;

  [val, ind] = min(P, [], 1);
  P = sparse(ind, 1:n, 1, num_clusters, n);
  centers = P*data;
  cluster_size = P*ones(n, 1);
  zero_cluster = find(cluster_size==0);

  if length(zero_cluster) > 0
    rnd_Idx = randperm(size(data,1),length(zero_cluster));  
    init_centers= data(rnd_Idx,:); 
    cluster_size(zero_cluster) = 1;
  end
  
  centers = spdiags(1./cluster_size, 0, num_clusters, num_clusters)*centers;

  y = sum(centers.*centers, 2);
  Y = y(:, ones(n, 1));
  P = X + Y - 2*centers*data';

  qnew = sum(sum(sparse(ind, 1:n, 1, size(P, 1), size(P, 2)).*P));

  if threshold >= abs((qnew-qold)/qold)
    q= qold;
    lables = ind';
    P = sparse(ind, 1:n, 1, num_clusters, n);
    centers = P*data;
    cluster_size = P*ones(n, 1);
    center = spdiags(1./cluster_size, 0, num_clusters, num_clusters)*centers;
    q= qnew;
    break;
  end
  qold = qnew;
end


function init_centers = random_init(data, num_clusters)
rnd_Idx = randperm(size(data,1),num_clusters);  
init_centers= data(rnd_Idx,:); 