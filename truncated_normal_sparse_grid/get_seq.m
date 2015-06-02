function fs = get_seq ( d, norm )

%*****************************************************************************80
%
%% GET_SEQ generates all positive integer D-vectors that sum to NORM.
%
%  Discussion:
%
%    This function computes a list, in reverse dictionary order, of
%    all D-vectors of positive values that sum to NORM.
%
%    For example, fs = get_seq ( 3, 5 ) returns
%
%      3  1  1
%      2  2  1
%      2  1  2
%      1  3  1
%      1  2  2
%      1  1  3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2010
%
%  Author:
%
%    Original MATLAB version by Florian Heiss, Viktor Winschel.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Florian Heiss, Viktor Winschel,
%    Likelihood approximation by numerical integration on sparse grids,
%    Journal of Econometrics,
%    Volume 144, 2008, pages 62-80.
%
%  Parameters:
%
%    Input, integer D, the dimension.
%
%    Input, integer NORM, the value that each row must sum to.
%    NORM must be at least D.
%
%    Output, integer FS(*,D).  Each row of FS represents one vector 
%    with all elements positive and summing to NORM.
%
  if ( norm < d )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GET_SEQ - Fatal error!\n' );
    fprintf ( 1, '  NORM = %d < D = %d.\n', norm, d );
    error ( 'GET_SEQ - Fatal error!' );
  end

  seq = zeros ( 1, d );
%
%  The algorithm is written to work with vectors whose minimum value is
%  allowed to be zero.  So we subtract D from NORM at the beginning and
%  then increment the result vectors by 1 at the end!
%
  a = norm - d;
  seq(1) = a;
  fs = seq;
  c = 1;

  while ( seq (d) < a )

    if ( c == d ) 
      for i = (c-1) : -1 : 1
        c = i;
        if ( seq(i) ~= 0 )
          break
        end
      end
    end

    seq(c) = seq(c) - 1;
    c = c + 1;
    seq(c) = a - sum ( seq(1:(c-1)) );

    if ( c < d ) 
      seq((c+1):d) = zeros ( 1, d - c );
    end

    fs = [ fs; seq ];

  end
%
%  Increment all entries by 1.
%
  fs = fs + 1;

  return
end
