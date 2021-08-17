function weights = weight_comp(graph, I1, I2, I4, I5)
n_instances = zeros(6, 8);
n_instances(1,:) = instance_count(I1, 1);
n_instances(2,:) = instance_count(I2, 2);
n_instances(3,:) = instance_count(I5, 5);
n_instances(4,:) = instance_count(I2, 2);
n_instances(5,:) = instance_count(I4, 4);
n_instances(6,:) = instance_count(I1, 1);

% not using a dynamic graph
weights = [];
weights = [weights n_instances(1,4) + n_instances(2,2) n_instances(1,5) + n_instances(2,1)];
weights = [weights n_instances(2,4) + n_instances(3,2) n_instances(2,5) + n_instances(3,1)];
weights = [weights n_instances(1,6) + n_instances(6,3) n_instances(1,7) + n_instances(6,2)];
weights = [weights n_instances(2,6) + n_instances(5,3) n_instances(2,7) + n_instances(5,2)];
weights = [weights n_instances(3,6) + n_instances(4,3) n_instances(3,7) + n_instances(4,2)];
weights = [weights n_instances(6,4) + n_instances(5,2) n_instances(6,5) + n_instances(5,1)];
weights = [weights n_instances(5,4) + n_instances(4,2) n_instances(5,5) + n_instances(4,1)];
end