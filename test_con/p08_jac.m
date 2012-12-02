%*****************************************************************************80
%
%% P08_JAC evaluates the jacobian for problem 8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the jacobian.
%
%    Output, real  JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  [ aval, cval ] = p08_gx ( );

  for i = 1 : 3
    for j = 1 : 3
      for k = 1 : 3
%
%  Compute norms.
%
        anrm = 0.0;
        xmanrm = 0.0;

        for l = 1 : 3
          anrm = anrm + aval(k,l)^2;
          xmanrm = xmanrm + ( x(l) - aval(k,l) )^2;
        end

        anrm = sqrt ( anrm );
        xmanrm = sqrt ( xmanrm );

        jac(i,j) = jac(i,j) + cval(k) * anrm * ( x(i) - aval(k,i) ) ...
                 * ( x(j) - aval(k,j) ) / xmanrm^3;

        if ( i == j )
          jac(i,j) = jac(i,j) - cval(k) * anrm / xmanrm;
        end

      end
    end
  end

  for i = 1 : 3
    jac(i,i) = jac(i,i) + 1.0;
  end
%
%  Add the loads.
%
  jac(1,4) = 1.0;
  jac(2,5) = 1.0;
  jac(3,6) = 1.0;
%
%  Apply the constraints.
%
  [ ival1, ival2, val1, val2 ] = p08_hx ( option );

  jac(4,ival1) = 1.0;
  jac(5,ival2) = 1.0;

  return
end
