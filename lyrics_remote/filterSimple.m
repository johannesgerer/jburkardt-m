function y = filterSimple(x,sosMatrix,scaleValues)

% FILTERSIMPLE Applies a filter to an input signal x.
%
%    OUTPUT = FILTERSIMPLE(INPUT,SOSMATRIX,SCALEVALUES)
%    Given a signal INPUT, and two variables SOSMATRIX and
%    SCALEVALUES that contain filter coefficients, this function
%    will process the INPUT using the given coefficients. The function
%    uses an IIR Direct-Form II Transposed structure to process the input.
%    
%    Example:
%    y = filterSimple(x,sosMatrix,scaleValues);

  sosSize = size(sosMatrix);
  numSections = sosSize(1);
  z = zeros([2 numSections]);

  xlen = length(x);
  y = x;

  for k = 1:numSections
    b = sosMatrix(k,1:3);
    a = sosMatrix(k,4:6);
    x = y * scaleValues(k);
    zk = z(:,k);
    for n = 1:xlen
        y(n)  = b(1) * x(n) + zk(1);
        zk(1) = b(2) * x(n) - a(2) * y(n) + zk(2);
        zk(2) = b(3) * x(n) - a(3) * y(n);
    end
  end

  y = y * scaleValues(end);

  return
end
