# Notes

Inspiration was the 2018 WWDC session [Embracing Algorithms (with Crusty)](https://developer.apple.com/videos/play/wwdc2018/223/), extolling the virtues of being familiar with your
standard library, such as stable/unstable partition for collections.

But finding just `partition(by:)`.

It is

* on MutableCollection

- takes a predicate. Things that match go after what don't match.
- returns the pivot index

so
```
    var blah = [1,2,3,4,5,6,7,8]
    let hoover = blah.partition(by: { ($0 % 2) == 0 })
yields
     pivot 4 with partition [1, 7, 3, 5, 4, 6, 2, 8]
                             0  1  2  3  4, 5, 6, 7 (index)
```
- first half is `blah[..<hoover]`
- second half is `blah[hoover...])`
- Definitely not stable on either side.
- looks like the stable version comes from swift-algorithms

* random cool things
  - `reversed()` is O(1)
  - `underedstimatedCount` - for Sequence, which could consume the sequence when doing
    a count.  (collections do promise you can walk through a sequence more than once)
  - joined is on colection, special version for string adding seperator

# Vocabulary / TODO

From a quick skim of the generated interface of Collection (via quicksearching
partition(by:))

* [ ] Collecton stuff
  - [ ] MutableCollection
  - [ ] CollectionofOne ("default implementation of core requirements")
        - look at the various adaoptions in categories (e.g. RandomAccessCollection,  
          self.element is comparable, etc)
  - [ ] BidirectionalCollection protocol
  - [ ] Refresh slice behavior
  - [ ] Lazy things
  - [ ] withContiguousStorageIfAvailable
  - [ ] min(areInIncreasingOrder...) / max
  - [ ] lexicographicallyPreceds (no connection to unicode)
  - [ ] allSatisfy
  - [ ] dig into reduce
  - [ ] compactmap, flatmap, and abednego
  - [ ] sort
  - [ ] indexing jazz
  - [ ] random element
  - [ ] difference

* Equivalence Relation
  - [ ] good to see you old friend (in context of `starts(with possiblePrefx:...)`)
  - for predicate P, to be an eqivalence relation, need
  - Reflexivity : a P a is true
  - Symmetry : a P b => b P a
  - transitivity : a P b and b P c => a P c
  

* [ ] swift-alogirthms / https://github.com/apple/swift-algorithms
  - there exist compact Guides for different topics.
  - all the things
    - [ ] combinations
    - [ ] permutations
    - [ ] unique permutations

    - [ ] rotate
    - [ ] stablePartition

    - [ ] chain
    - [ ] cycled
    - [ ] joined
    - [ ] product (cartesian)

    - [ ] compacted
    - [ ] randomStableSample
    - [ ] striding(by:)
    - [ ] suffix(wile:)
    - [ ] trimmingPrefix/Suffix/while
    - [ ] uniqued (on:)
    - [ ] minAndMax (by:)

    - [ ] min/max(count:), (count:sortedBy:)  

    - [ ] adjacentPairs
    - [ ] chunked by/on/ofCount
    - [ ] firstNonNil
    - [ ] indexed
    - [ ] partitioningIndex(where:)
    - [ ] reductions
    - [ ] split (long signatures)
    - [ ] windows(ofCount:)

### ilyxc

Trying to use Algorithms in a playground. Added a playground, added to the projct,
import Algorithms - completion works, building does not. 

```
value of type '[Int]' has no member 'uniqued'
```

~Asking around, and giving up for now.~  Had to restart Xcode.  _sigh_.


### Permutations

https://github.com/apple/swift-algorithms/blob/main/Guides/Permutations.md

motivation - AoC 1.1 is "find two entries in an array that sum to some specific value",
straightforward way is nested for loops

Something like

```
    for perm in stuff.permutations(ofCount: 2) {
        if perm[0] + perm[1] == 2020 {
            let solution = perm[0] * perm[1]
            print("FOUND IT \(solution)")
            break
        }
    }
```

works!  Doing it with ofCount: 3 is really slow (debug).  Give it a try with
instruments (so building optimized)

```
    for perm in stuff.permutations(ofCount: 3) {
        if perm[0] + perm[1] + perm[2] == 2020 {
            let solution = perm[0] * perm[1] * perm[2]
            print("FOUND IT \(solution)")
            break
        }
    }
```

Yeah, it's optimized vs not.  twenty one seconds, for 201 elements in the array.
all in `Permutations.Iterator.nextState()`

how is just nested loops?

```
    spoon: for (index1, thing1) in stuff.enumerated() {
        for (index2, thing2) in stuff.enumerated() {
            for (index3, thing3) in stuff.enumerated() {
                if index1 == index2 { continue }
                if index2 == index3 { continue }
                if index1 == index3 { continue }
                
                if thing1 + thing2 + thing3 == 2020 {
                    let solution = thing1 * thing2 * thing3
                    print("FOUND IT \(solution)")
                    break spoon
            }
        }
    }
```

performance is great.  So if it were pairwise or three-wise permutations, then
may do nested loops so we can debug things without waiting forever.  For larger
permutations, the `permutations` call would be more convenience assuming sacrificing
debuggability is ok.

For this thing, we don't need the lexicographic ordering.

