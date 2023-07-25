[33mcommit c3fc35a59510885e60fe143fe08aafad1e3be054[m[33m ([m[1;36mHEAD -> [m[1;32mrp282/add-sprite-colors[m[33m, [m[1;31morigin/rp282/piece-movement-acceleration[m[33m, [m[1;32mrp282/piece-movement-acceleration[m[33m)[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Sun Jul 23 22:27:33 2023 -0700

    commented acceleration

[33mcommit 21ef6da01c9ae9ed5ec05a205bbbcd922b95cac6[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Sun Jul 23 22:22:47 2023 -0700

    linted

[33mcommit dffc0fca519d37f80c9fa653fd087828d74ecd71[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Sun Jul 23 22:14:58 2023 -0700

    piece rotation algorithm simplification

[33mcommit 3b403473a674ec852219501cbf871b0a2aa1edc4[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Sun Jul 23 21:04:06 2023 -0700

    0.1 feature implemented need to play test tweak for feeling

[33mcommit 73f9efdc6921d7df4b8b4a26b64e240f2b731f79[m[33m ([m[1;31morigin/main[m[33m, [m[1;31morigin/HEAD[m[33m, [m[1;32mmain[m[33m)[m
Author: Norman Kuang <nkuang123@gmail.com>
Date:   Sun Jul 23 20:15:42 2023 -0700

    [Piece Holding] Implement and render basic piece holding (#21)
    
    * working piece holding with ints
    
    * rudimentary piece holder rendering
    
    * remove tmp files
    
    ---------
    
    Co-authored-by: Ryan <ryanpun282@gmail.com>

[33mcommit e4e7fd557f41f57e1fcf530fb6a36877e25a4e09[m
Author: Norman Kuang <nkuang123@gmail.com>
Date:   Sun Jul 23 19:20:17 2023 -0700

    [Animation] Implement row-clearing animations (#16)
    
    * prelim explosion animation clearing
    
    * working explosions, just need to fix offset
    
    * hardcoded offsets for now
    
    * refactor
    
    * remove unused assets
    
    * cleanup
    
    * fix import
    
    * remove tmp files
    
    * hopefully fixed formatting
    
    * remove unused line
    
    ---------
    
    Co-authored-by: Ryan <ryanpun282@gmail.com>

[33mcommit 6b7282a29b5e587507867cf1bfbf8a414342bd88[m
Author: Norman Kuang <nkuang123@gmail.com>
Date:   Sun Jul 23 19:17:02 2023 -0700

    [Cleanup] Follow styling conventions for const/enums (#17)
    
    * cleanup constants
    
    * run formatter
    
    * add trailing commas
    
    * linted 2
    
    ---------
    
    Co-authored-by: Ryan <ryanpun282@gmail.com>

[33mcommit 71654738616c0f148042cba3ea5caa5047eb6b41[m
Author: rp282 <ryanpun282@gmail.com>
Date:   Sun Jul 23 18:59:46 2023 -0700

    [Board] Added background (#15)
    
    * added background
    
    * rewrote game data class
    
    * rewrote to add layer enums
    
    * linted
    
    * lint with spaces

[33mcommit cc14673c3b8802583a273e831aa1e518a6e21c8d[m
Author: rp282 <ryanpun282@gmail.com>
Date:   Fri Jul 21 20:07:36 2023 -0700

    [Piece] New piece additions setup & fix tile set errors (#14)
    
    fixed debugger tile map errors

[33mcommit bab2b7fef729852b70b1ac95dcfdc73daad45875[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Thu Jul 20 23:41:08 2023 -0700

    restore resolution

[33mcommit ef0451c791f399f90f028db5ddc888c08aa5d24b[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Thu Jul 20 23:39:07 2023 -0700

    fix main bugs

[33mcommit 34ec3b425fa6faf2858f93597eef98da568e969d[m
Author: rp282 <ryanpun282@gmail.com>
Date:   Thu Jul 20 23:07:10 2023 -0700

    Rp282/piece board integration (#12)
    
    * rem unused files
    
    * scrap collider pieces
    
    * scrap collider pieces
    
    * integrating piece logic into board in progress
    
    * hard drop, rotation, collision
    
    * MVP LFG!
    
    * MVP 2
    
    * rem exe
    
    * linted
    
    * fixed rotation center offset values for line and square, added rotation validation
    
    * sound effects
    
    * more sounds
    
    * softened game over sound
    
    * drew sprites
    
    * addressed changes

[33mcommit 6c1b57dda66a1213ad402d84414b9cde65879886[m
Author: Matt Pettenato <66044946+mattpettenato@users.noreply.github.com>
Date:   Sat Jul 15 23:23:35 2023 -0700

    [Piece] - Adding pieces (#9)
    
    * changed block name to piece
    
    * test
    
    test
    
    * moving left and right. side detection in progress
    
    * random piece selection and rotation implementation
    
    * add comments and add initial position
    
    * sprites, center of rotation
    
    * cleanup debug prints
    
    * linted
    
    * tilemap setup
    
    * tilemap setup
    
    * fix alignment bug
    
    * fix alignment bug 2
    
    * other stuff
    
    * copy main tile map scene
    
    * used updated cleared tile map scene
    
    * clean up tile map tiles
    
    ---------
    
    Co-authored-by: Ryan <ryanpun282@gmail.com>

[33mcommit 6f9c78d6485d14001d58f980b49679671b3eae3e[m
Author: Norman Kuang <nkuang123@gmail.com>
Date:   Sat Jul 15 23:06:38 2023 -0700

    [Board] Basic row-clearing and updating (#11)
    
    * first-pass Board logic
    
    * add comments
    
    * remove hardcode testing + tiles

[33mcommit 84ccee35acc8d20c4a9cab5d55b833bf329871e9[m
Merge: a6d1a7f 06f5b8f
Author: Norman Kuang <nkuang123@gmail.com>
Date:   Thu Jul 13 23:05:03 2023 -0700

    [Tetris] Game base code
    
    [Tetris] Game base code

[33mcommit 06f5b8f2e1e45f0c9c14e7c9973cbceba7376194[m
Author: nkuang <nkuang123@gmail.com>
Date:   Thu Jul 13 23:02:02 2023 -0700

    first version game

[33mcommit 00f9a22c005cc127c5b667fd5ed9442f533bf461[m
Author: Norman <nkuang@vassar.edu>
Date:   Wed Jul 12 23:22:16 2023 -0700

    static tiles in a tilemap

[33mcommit a6d1a7f6f1a1583337585c210d8ff84b470f8cbd[m
Merge: f812fc7 ec16b00
Author: rp282 <ryanpun282@gmail.com>
Date:   Tue Jul 11 20:39:25 2023 -0700

    Merge pull request #3 from ThirdBlockStudios/rp282/project-organization-branch
    
    set up project folder structure and minor tweaks to README

[33mcommit ec16b003096011a7da517d9a2f1f7fe53d149db0[m[33m ([m[1;31morigin/rp282/project-organization-branch[m[33m)[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Tue Jul 11 19:38:08 2023 -0700

    [Documentation] set up project folder structure and made tweaks to class and function names

[33mcommit e8139e7511822f7b9057567929445bb89ffcdba0[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Sun Jul 9 23:01:26 2023 -0700

    set up project folder structure and minor tweaks to README

[33mcommit f812fc78cbd172f6823225fa6af406cfc40e66e8[m
Author: rp282 <ryanpun282@gmail.com>
Date:   Sun Jul 9 22:57:04 2023 -0700

    Update README.md

[33mcommit d706144c3b48a9050cabb97fbb1c4caa78d25e4b[m
Author: rp282 <ryanpun282@gmail.com>
Date:   Sun Jul 9 22:53:43 2023 -0700

    Update README.md gpt

[33mcommit 5b67962971beb530d6979fe1b48dafa4914f7e28[m
Author: Norman Kuang <nkuang123@gmail.com>
Date:   Sun Jul 9 22:49:46 2023 -0700

    fix

[33mcommit c0b47792a169b33f8ba7e88d7127b275613509a0[m
Merge: a17a1e9 c792fed
Author: Norman Kuang <nkuang123@gmail.com>
Date:   Sun Jul 9 22:43:45 2023 -0700

    [Documentation] Update README
    
    Add JIRA link + brainstorming sesh

[33mcommit c792fed29ad2c7a6381386d6132e2d5501a2acb2[m
Author: Norman <nkuang@vassar.edu>
Date:   Sun Jul 9 22:36:30 2023 -0700

    update README

[33mcommit a17a1e9d9d58c17485c25c66826bacbb3419e307[m
Merge: c2342c1 b090897
Author: rp282 <ryanpun282@gmail.com>
Date:   Sun Jul 9 22:11:30 2023 -0700

    Merge pull request #1 from ThirdBlockStudios/rp282/first_branch
    
    added Main node

[33mcommit b0908977444bab222561e5b05aea469e5555c51a[m[33m ([m[1;31morigin/rp282/first_branch[m[33m)[m
Author: Ryan <ryanpun282@gmail.com>
Date:   Sun Jul 9 22:02:51 2023 -0700

    added Main node

[33mcommit c2342c1472b4420927dd99f7085c8f8f1fb26d1d[m
Author: Norman <nkuang@vassar.edu>
Date:   Sun Jul 9 21:56:23 2023 -0700

    first commit xD

[33mcommit c4414ade4eb4d049ee13ca06c5d4d806a1017f99[m
Author: Norman Kuang <nkuang@vassar.edu>
Date:   Sun Jul 9 21:46:45 2023 -0700

    Initial commit
