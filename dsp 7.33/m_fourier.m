function Y = m_fourier(w, hn)

    len = length(hn);
    Y = 0;
    for k = 1: len
        Y = Y + hn(k) .* exp(1i * (k - 1) * w);
    end

end