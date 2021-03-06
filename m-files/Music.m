clear all 
clc 
AntennaData = load('test');
DataMatrix=AntennaData.x;
N=15;    %Number of array elements
K=200;   %Number of data snapshots
d=0.5;   %Distance between elements in wavelengthsj

 R=DataMatrix*DataMatrix'/200;
 [U,S,V]=svd(R);
 [Q ,D]=eig(R);
 [D,I]=sort(diag(D),1,'descend');   %Find r largest eigenvalues
    

 Q=Q (:,I); %Sort the eigenvectors to put signal eigenvectors first
 Qs=Q (:,1:3); %Get the signal eigenvectors
 Qn=Q(:,4:N); %Get the noise eigenvectors
 angles=(-90:0.01:90);
 %Compute steering vectors corresponding values in angles
 a1=exp(-i*2*pi*d*(0:N-1)'*sin([angles(:).']*pi/180));
 for k=1:length(angles)
 %Compute MUSIC ?spectrum?
 music_spectrum(k)=(a1(:,k)'*a1(:,k))/(a1(:,k)'*Qn*Qn'*a1(:,k));
 end
 plot(abs(angles),abs(music_spectrum))
 grid on
 title('MUSIC Spectrum')
 xlabel('Angle in degrees')

