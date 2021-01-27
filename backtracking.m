function [alpha, info] = backtracking(F, x_k, p, alpha, opts)
    while F.f(x_k+alpha.*p) >= F.f(x_k)+(opts.c1*alpha).*((p).')*(F.df(x_k))
        alpha = alpha*opts.rho
        info.alphas(end+1) = alpha
    end
end