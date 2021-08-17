%% Function to return labels where score is greater than threshold n
function [s, idx] = scorethreshold(scores, n)
    s = [];
    idx = [];
    if ~isempty(scores)
        for i = 1:length(scores)
            if scores(i)>n
                s = [s; scores(i)];
                idx = [idx; i];
            end
        end
    end
end