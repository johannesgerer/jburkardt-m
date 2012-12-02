function z = dirder ( x, w, f, f0 )

%% DIRDER estimates the directional derivative of a function F.
% 
%  Disclaimer:
%
%    This code comes with no guarantee or warranty of any kind.
%
%  Author:
%
%    Tim Kelley
%
%  Reference:
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%
%  Parameters:
%
%    Input, real X(N), the point at which the derivative is to be estimated.
%
%    Input, real W(N), the direction.
%
%    Input, real F(X), the function whose derivative is to be estimated.
%
%    Input, real F0(N), the value F(X).
%
%    Output, real Z(N), the estimate for the directional derivative of F.
%

%
% Hardwired difference increment.
%
  epsnew = 1.0E-07;

  n = length ( x );
%
%  Scale the step.
%
  if ( norm ( w ) == 0.0 )
    z = zeros ( n, 1 );
    return
  end

  epsnew = epsnew / norm ( w );

  if ( 0.0 < norm ( x ) )
    epsnew = epsnew * norm ( x );
  end
%
%  DEL and F1 could share the same space if storage
%  is more important than clarity.
%
  del = x + epsnew * w;
  f1 = feval ( f, del );
  z = ( f1 - f0 ) / epsnew;
