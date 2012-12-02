function val = source(x_g, param)

% Evaluate source terms (if any) at points x_g


% characteristic functions for source terms
    chi1_g = (x_g(:,1) < 0.2*param.L).*(x_g(:,2) < 0.5*param.W);
    chi3_g = (x_g(:,1) > 0.8*param.L).*(x_g(:,2) > 0.5*param.W);
%   chi2_g = ~chi1_g & ~chi3_g;

    val =   0*chi1_g +   0*chi3_g;
%

  return
end
