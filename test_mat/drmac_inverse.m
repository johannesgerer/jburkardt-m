function a = drmac_inverse ( scale, permute )

%*****************************************************************************80
%
%% DRMAC_INVERSE returns the inverse of the Drmac matrix.
%
%  Discussion:
%
%    The Drmac matrix is available in a "badly scaled" or "well scaled" 
%    version, and in versions that have been symmetrically permuted.
%
%  Formula (Inverse of Badly Scaled Matrix):
%
%    1.0185185E-40  -0.0925925E-30  -0.0925925E-20
%   -0.0925925E-30   1.0185185E-20  -0.0925925E-10
%   -0.0925925E-20  -0.0925925E-10   1.0185185E+00
%
%  Formula (Inverse of Well Scaled Matrix):
%
%    1.0185185  -0.0925925  -0.0925925
%   -0.0925925   1.0185185  -0.0925925
%   -0.0925925  -0.0925925   1.0185185
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SCALE:
%    0, return the badly matrix.
%    1, return the well scaled matrix.
%
%    Input, integer PERMUTE:
%    0, output the matrix as it is (with rows and columns in the order (1,2,3) ).
%    1, output the matrix with rows and columns in the order (1,3,2).
%    2, output the matrix with rows and columns in the order (2,1,3).
%    3, output the matrix with rows and columns in the order (2,3,1).
%    4, output the matrix with rows and columns in the order (3,1,2).
%    5, output the matrix with rows and columns in the order (3,2,1).
%
%    Output, real A(3,3), the inverse of the Drmac matrix.
%
  if ( scale == 0 )
  
    a(1:3,1:3) = [
       1.1E-40, -0.1E-30, -0.1E-20; ...
      -0.1E-30,  1.1E-20, -0.1E-10; ...
      -0.1E-20, -0.1E-10,  1.1E+00 ];
	  
    a(1:3,1:3) = a(1:3,1:3) / 1.08;
	  
  elseif ( scale == 1 )

    a(1:3,1:3) = [ ...
       1.1, -0.1, -0.1; ...
      -0.1,  1.1, -0.1; ...
      -0.1, -0.1,  1.1 ];
	  
    a(1:3,1:3) = a(1:3,1:3) / 1.08;
    
  else
  
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DRMAC_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of SCALE = %d\n', scale );
    error ( 'DRMAC_INVERSE - Fatal error!' );
	
  end

  if ( permute == 0 )
    perm(1:3) = [ 1, 2, 3 ];
  elseif ( permute == 1 )
    perm(1:3) = [ 1, 3, 2 ];
  elseif ( permute == 2 )
    perm(1:3) = [ 2, 1, 3 ];
  elseif ( permute == 3 )
    perm(1:3) = [ 2, 3, 1 ];
  elseif ( permute == 4 )
    perm(1:3) = [ 3, 1, 2 ];
  elseif ( permute == 5 )
    perm(1:3) = [ 3, 2, 1 ];
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DRMAC_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PERMUTE = %d\n', permute );
    error ( 'DRMAC_INVERSE - Fatal error!' );
  end
  
  a(1:3,1:3) = a( perm(1:3), perm(1:3) );

  return
end
