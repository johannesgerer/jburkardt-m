function value = plu_determinant ( n, pivot )

%*****************************************************************************80
%
%% PLU_DETERMINANT returns the determinant of the PLU matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer PIVOT(N), the list of pivot rows.  PIVOT(I)
%    must be a value between I and N, reflecting the choice of
%    pivot row on the I-th step.  For no pivoting, set PIVOT(I) = I.
%
%    Output, real VALUE, the determinant.
%
  [ p, l, u ] = plu_plu ( n, pivot );

  value = 1.0;

  for i = 1 : n
    value = value * u(i,i);
  end

  for i = 1: n

    found = 0;
    for i2 = i : n
      if ( p(i2,i) == 1.0 )
        found = 1;
        if ( i2 ~= i )
          prow(1,1:n) = p(i2,1:n);
          p(i2,1:n) = p(i,1:n);
          p(i,1:n)  = prow(1,1:n);
          value = - value;
        end
      end
    end

    if ( found == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PLU_DETERMINANT - Fatal error!\n' );
      fprintf ( 1, '  Permutation matrix is illegal.\n' );
      error ( 'PLU_DETERMINANT - Fatal error!' )
    end

  end


  return
end

