module TaskContainerBuilder

go 1.15

require (
	github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef // indirect
	github.com/golang/protobuf v1.3.2 // indirect
	github.com/imdario/mergo v0.3.9 // indirect
	github.com/stretchr/testify v1.4.0
	golang.org/x/sys v0.0.0-20190624142023-c5567b49c5d0 // indirect
	golang.org/x/time v0.0.0-20200416051211-89c76fbcd5d1 // indirect
	google.golang.org/appengine v1.6.1 // indirect
	gopkg.in/yaml.v2 v2.2.4 // indirect
	k8s.io/api v0.18.3
	k8s.io/apimachinery v0.18.3
	k8s.io/client-go v11.0.0+incompatible
	k8s.io/utils v0.0.0-20200520001619-278ece378a50 // indirect

)

replace k8s.io/client-go v11.0.0+incompatible => k8s.io/client-go v0.0.0-20190918160344-1fbdaa4c8d90 // indirect

replace k8s.io/apimachinery v0.18.3 => k8s.io/apimachinery v0.0.0-20190913080033-27d36303b655
