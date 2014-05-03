cost = 0;
for k=1:27
    cost = cost + log(output(k));  % first cost term
    cost = cost + ((1-train_output(i,k)) * log(1 - output(k))); % second cost term
end;
