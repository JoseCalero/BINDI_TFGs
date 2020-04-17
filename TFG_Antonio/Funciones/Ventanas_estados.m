function ventanas = Ventanas_estados(label)
    
baseline = find(label==1);
stress = find(label==2);
amusement = find(label==3);
meditation = find(label==4);

n = 1;
N = 1;
while (meditation(n+1) - meditation(n) == 1)
    medi1(N) = meditation(n);
    N = N + 1;
    n = n + 1;
end
medi1(N) = meditation(n);

n = n + 1;
N = 1;
while (meditation(n+1) - meditation(n) == 1 && n+1 < length(meditation))
    medi2(N) = meditation(n);
    N = N + 1;
    n = n + 1;
end

ventanas = [baseline(1), baseline(end), stress(1), stress(end), medi1(1), medi1(end), amusement(1), amusement(end), medi2(1), medi2(end)];

end