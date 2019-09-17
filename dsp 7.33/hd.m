function Y = hd(n, tau)

    tmp = (n - tau) * pi;
    Y = 1 - cos(tmp);
    Y = Y ./ tmp;
    if tau == fix(tau)
        Y(tau + 1) = 0;
    end

end