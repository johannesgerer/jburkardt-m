function variance = english_word_length_variance ( )

%*****************************************************************************80
%
%% ENGLISH_WORD_LENGTH_VARIANCE: variance of the English Word Length PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Henry Kucera, Winthrop Francis,
%    Computational Analysis of Present-Day American English,
%    Brown University Press, 1967.
%
%  Parameters:
%
%    Output, real VARIANCE, the variance of the PDF.
%
  word_length_max = 27;

  pdf_vec = [ ...
    0.03160, ...
    0.16975, ...
    0.21192, ...
    0.15678, ...
    0.10852, ...
    0.08524, ...
    0.07724, ...
    0.05623, ...
    0.04032, ...
    0.02766, ...
    0.01582, ...
    0.00917, ...
    0.00483, ...
    0.00262, ...
    0.00099, ...
    0.00050, ...
    0.00027, ...
    0.00022, ...
    0.00011, ...
    0.00006, ...
    0.00005, ...
    0.00002, ...
    0.00001, ...
    0.00001, ...
    0.00001, ...
    0.00001, ...
    0.00001 ];
  pdf_sum = 0.99997;

  mean = 0.0;
  for j = 1 : word_length_max
    mean = mean + j * pdf_vec(j);
  end

  mean = mean / pdf_sum;

  variance = 0.0;
  for j = 1 : word_length_max
    variance = variance + pdf_vec(j) * ( j - mean )^2; 
  end

  variance = variance / pdf_sum;

  return
end