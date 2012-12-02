function [ max_adif, max_adif_i, max_adif_j, max_rdif, max_rdif_i, max_rdif_j ] = ...
  p00_jac_check ( problem, option, nvar, x )

%*****************************************************************************80
%
%% P00_JAC_CHECK compares the jacobian with a finite difference estimate.
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
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the jacobian.
%
%    Output, real MAX_ADIF, the maximum absolute difference.
%
%    Output, integer MAX_ADIF_I, MAX_ADIF_J, the indices where
%    the maximmum absolute difference was found.
%
%    Output, real MAX_RDIF, the maximum relative difference.
%
%    Output, integer MAX_RDIF_I, MAX_RDIF_J, the indices where
%    the maximmum relative difference was found.
%
  rel = 0.0001;
%
%  Compute the jacobian.
%
  jac = p00_jac ( problem, option, nvar, x );
  jac_norm = max ( max ( abs ( jac ) ) );
%
%  Estimate the jacobian via finite differences.
%
  jac_dif = p00_jac_dif ( problem, option, nvar, x );
%
%  Compare the jacobians.
%
  max_rdif = 0.0;
  max_rdif_i = 0;
  max_rdif_j = 0;

  max_adif = 0.0;
  max_adif_i = 0;
  max_adif_j = 0;

  for i = 1 : nvar - 1
    for j = 1 : nvar

      dif = abs ( jac(i,j) - jac_dif(i,j) );

      if ( max_adif < dif )
        max_adif = dif;
        max_adif_i = i;
        max_adif_j = j;
      end

      if ( rel < abs ( jac(i,j) ) )
        if ( max_rdif * abs ( jac(i,j) ) < dif )
          max_rdif = dif / abs ( jac(i,j) );
          max_rdif_i = i;
          max_rdif_j = j;
        end
      end

    end
  end

  return
end
