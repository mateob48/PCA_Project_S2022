spmd
    source = 1;
    if labindex == source
        A = magic(3);
        B = labBroadcast(source, A);
    else
        B = labBroadcast(source);
    end
    B
end