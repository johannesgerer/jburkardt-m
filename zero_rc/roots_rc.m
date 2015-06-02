function [ xnew, ferr, q ] = roots_rc ( n, x, fx, q )

%*****************************************************************************80
%
%% ROOTS_RC solves a system of nonlinear equations using reverse communication.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2013
%
%  Author:
%
%    Original FORTRAN77 version by Gaston Gonnet.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Gaston Gonnet,
%    On the Structure of Zero Finders,
%    BIT Numerical Mathematics,
%    Volume 17, Number 2, June 1977, pages 170-183.
%
%  Parameters:
%
%    Input, integer N, the number of equations.
%
%    Input, real X(N).  Before the first call, the user should
%    set X to an initial guess or estimate for the root.  Thereafter, the input
%    value of X should be the output value of XNEW from the previous call.
%
%    Input, real FX(N), the value of the function at XNEW.
%
%    Workspace, real ( kind = 8 ) Q(2*N+2,N+2).  Before the first call
%    for a given problem, the user must set Q(2*N+1,1) to 0.0.
%
%    Output, real ( kind = 8 ) XNEW(N), a new point at which a function
%    value is requested.
%
%    Output, real ( kind = 8 ) FERR, the function error, that is, the sum of
%    the absolute values of the most recently computed function vector.
%
%    Workspace, real ( kind = 8 ) Q(2*N+2,N+2).  
%
  ferr = sum ( abs ( fx(1:n) ) );
%
%  Initialization if Q(2*N+1,1) = 0.0.
%
  if ( q(2*n+1,1) == 0.0 )

    for i = 1 : n
      for j = 1 : n + 1
        q(i,j) = 0.0;
        q(i+1,j) = 0.0;
      end
      q(i,i) = 100.0;
      q(i+n,i) = 1.0;
    end

    q(2*n+1,1:n) = 1.0E+30;
    q(2*n+2,1:n) = n;

    for i = 1 : n
      q(i+n,n+1) = x(i);
    end

    q(1:n,n+1) = fx(1:n);

    q(2*n+1,n+1) = ferr;
    q(2*n+2,n+1) = 0.0;
    damp = 0.99;

  else

    jsus = 1;
    for i = 2 : n + 1
      if ( 2 * n <= q(2*n+2,i) )
        q(2*n+1,i) = 1.0E+30;
      end
      if ( q(2*n+2,jsus) < floor ( ( n + 3 ) / 2 ) )
        jsus = i;
      end
      if ( ( n + 3 ) / 2 <= q(2*n+2,i) && q(2*n+1,jsus) < q(2*n+1,i) )
        jsus = i;
      end
    end

    for i = 1 : n
      q(i+n,jsus) = x(i);
      q(i,jsus) = fx(i);
    end

    q(2*n+1,jsus) = ferr;
    q(2*n+2,jsus) = 0;
    jsma = 1;
    damp = 0.0;

    for j = 1 : n + 1
      if ( 1.0E+30 / 10.0 < q(2*n+1,j) )
        damp = 0.99;
      end
      if ( q(2*n+1,j) < q(2*n+1,jsma) )
        jsma = j;
      end
    end

    if ( jsma ~= n + 1 )
      for i = 1 : 2 * n + 2
        t = q(i,jsma);
        q(i,jsma) = q(i,n+1);
        q(i,n+1) = t;
      end
    end

  end

  q(1:n,n+2) = q(1:n,n+1);
%
%  Call the linear equation solver, which should not destroy the matrix
%  in Q(1:N,1:N), and should overwrite the solution into Q(1:N,N+2).
%
  q(1:n,n+2) = q(1:n,1:n) \ q(1:n,n+2);

  sump = sum ( q(1:n,n+2) );

  if ( abs ( 1.0 - sump ) <= 1.0E-10 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ROOT - Fatal error!\n' );
    fprintf ( 1, '  SUMP almost exactly 1.\n' );
    fprintf ( 1, '  SUMP = %g\n', sump );
    error ( 'ROOTS_RC - Fatal error!' );
  end

  for i = 1 : n
    xnew(i) = q(i+n,n+1);
    for j = 1 : n
      xnew(i) = xnew(i) - q(i+n,j) * q(j,n+2);
    end
%
%  If system not complete, damp the solution.
%
    xnew(i) = xnew(i) / ( 1.0 - sump ) * ( 1.0 - damp ) ...
      + q(i+n,n+1) * damp;

  end

  for j = 1 : n + 1
    q(2*n+2,j) = q(2*n+2,j) + 1.0;
  end

  return
end
