function [ n_data, n, fn ] = subfactorial_values ( n_data )

%*****************************************************************************80
%
%% SUBFACTORIAL_VALUES returns values of the subfactorial function.
%
%  Discussion:
%
%    The subfactorial function Subfactorial(N) counts the number of 
%    permutations of N objects which leave no object unchanged.
%
%    Such a permutation is known as a derangement.
%
%    In Mathematica, the function can be evaluated by:
%
%      << DiscreteMath`CombinatorialFunctions`
%      Subfactorial[n]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Cambridge University Press, 1999,
%    ISBN: 0-521-64314-7,
%    LC: QA76.95.W65.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer N, the argument of the function.
%
%    Output, integer FN, the value of the function.
%
  n_max = 13;

  fn_vec = [ ...
            1, ...
            0, ...
            1, ...
            2, ...
            9, ...
           44, ...
          265, ...
         1854, ...
        14833, ...
       133496, ...
      1334961, ...
     14684570, ...
    176214841 ];

  n_vec = [ ...
     0,  1,  2,  3, ...
     4,  5,  6,  7, ...
     8,  9, 10, 11, ...
    12 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    fn = 0;
  else
    n = n_vec(n_data);
    fn = fn_vec(n_data);
  end

  return
end
