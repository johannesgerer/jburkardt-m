function bvec = binary_vector_next ( n, bvec )

%*****************************************************************************80
%
%% BINARY_VECTOR_NEXT generates the next binary vector.
%
%  Discussion:
%
%    A binary vector is a vector whose entries are 0 or 1.
%
%    The user inputs an initial zero vector to start.  The program returns
%    the "next" vector.
%
%    The vectors are produced in the order:
%
%    ( 0, 0, 0, ..., 0 )
%    ( 1, 0, 0, ..., 0 )
%    ( 0, 1, 0, ..., 0 )
%    ( 1, 1, 0, ..., 0 )
%    ( 0, 0, 1, ..., 0 )
%    ( 1, 0, 1, ..., 0 )
%               ...
%    ( 1, 1, 1, ..., 1)
%
%    and the "next" vector after (1,1,...,1) is (0,0,...,0).  That is,
%    we allow wrap around.
%
%  Example:
%
%    N = 3
%
%    Input      Output
%    -----      ------
%    0 0 0  =>  1 0 0
%    1 0 0  =>  0 1 0
%    0 1 0  =>  1 1 0
%    1 1 0  =>  0 0 1
%    0 0 1  =>  1 0 1
%    1 0 1  =>  0 1 1
%    0 1 1  =>  1 1 1
%    1 1 1  =>  0 0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vectors.
%
%    Input/output, integer BVEC(N), on output, the successor
%    to the input vector.
%
  for i = 1 : n

    if ( bvec(i) == 1 )
      bvec(i) = 0;
    else
      bvec(i) = 1;
      break
    end

  end

  return
end
