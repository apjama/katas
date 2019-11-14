package space

import "fmt"

type planet struct {
	name    string
	seconds float64
}

// this is a good thing
func NewPlanet(name string) *planet {
	p := planet{name: name}
	p.seconds = 42
	return &p
}

func main() {
	fmt.Println(planet{"Bob", 20})
}
