% calculates Fourier inverse transform
function s = fourier_inv_transform(z, nd)
   
% ND is the approximate number of Fourier descriptors retained
% for the reconstruction. It must be an integer no greater than
% length(Z). If omitted, all descriptors are used.
%
% The output S contains the reconstructed contour coordinates and
% has the same number of points as Z.

      np = length(z);
      if nargin == 1 | nd > np
        nd = np;
      end
      x = 0:(np - 1);
      m = ((-1) .^ x)';
      d = round((np - nd)/2);
      z(1:d) = 0;
      z(np - d + 1:np) = 0;
      zz = ifft(z); % Inverse fast Fourier transform
      s(:, 1) = real(zz);
      s(:, 2) = imag(zz);
      s(:, 1) = m.*s(:, 1);
      s(:, 2) = m.*s(:, 2);
