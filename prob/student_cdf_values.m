function [ n_data, c, x, fx ] = student_cdf_values ( n_data )

%*****************************************************************************80
%
%% STUDENT_CDF_VALUES returns some values of the Student CDF.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      Needs["Statistics`ContinuousDistributions`"]
%      dist = StudentTDistribution [ df ]
%      CDF [ dist, x ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, real C, is usually called the number of 
%    degrees of freedom of the distribution.  C is typically an 
%    integer, but that is not essential.  It is required that
%    C be strictly positive.
%
%    Output, real X, the argument of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 13;

  c_vec = [ ...
    1.0, 2.0, 3.0, 4.0, ...
    5.0, 2.0, 5.0, 2.0, ...
    5.0, 2.0, 3.0, 4.0, ...
    5.0 ];

  fx_vec = [ ...
     0.6000231200328521, ...
     0.6001080279134390, ...
     0.6001150934648930, ...
     0.6000995134721354, ...
     0.5999341989834830, ...
     0.7498859393137811, ...
     0.7500879487671045, ...
     0.9500004222186464, ...
     0.9499969138365968, ...
     0.9900012348724744, ...
     0.9900017619355059, ...
     0.9900004567580596, ...
     0.9900007637471291 ];

  x_vec = [ ...
     0.325, ...
     0.289, ...
     0.277, ...
     0.271, ...
     0.267, ...
     0.816, ...
     0.727, ...
     2.920, ...
     2.015, ...
     6.965, ...
     4.541, ...
     3.747, ...
     3.365 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    c = 0.0;
    x = 0.0;
    fx = 0.0;
  else
    c = c_vec(n_data);
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
