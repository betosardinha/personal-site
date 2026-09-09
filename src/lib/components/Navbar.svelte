<script lang="ts">
  import * as NavigationMenu from '$lib/components/ui/navigation-menu/index.js';
  import ThemeToggle from '$lib/components/ThemeToggle.svelte';
  import MenuToggle from '$lib/components/MenuToggle.svelte';
  import { cn } from '$lib/utils.js';

  let active = $state('/');
  let menuOpen = $state(false);

  function selectSection(id: string) {
    return () => {
      active = id;
      menuOpen = false;
    };
  }

  const navLinkClass = cn(
    'w-24 justify-center underline decoration-1 underline-offset-2 decoration-transparent',
    'transition-colors duration-300',
    'hover:bg-transparent hover:decoration-red-500 focus:bg-transparent',
    'data-[active]:decoration-red-500 data-[active]:decoration-2'
  );
</script>

<NavigationMenu.Root class={cn('relative z-10 max-w-full justify-start pt-4 border-b border-red-500 bg-background')}>
  <MenuToggle bind:open={menuOpen} class="lg:hidden" />

  <NavigationMenu.List class={cn('max-lg:absolute max-lg:left-1/2 max-lg:top max-lg:-translate-x-1/2 max-lg:-translate-y-1/2')}>
    <NavigationMenu.Item>
      <NavigationMenu.Link href="/" onclick={selectSection('#home')} class={cn('justify-center rounded-b-none font-extrabold', 'w-50 !bg-red-500')}>
        betosardinha.dev
      </NavigationMenu.Link>
    </NavigationMenu.Item>
  </NavigationMenu.List>

  <NavigationMenu.List
    class={cn(
      'max-lg:absolute max-lg:left-0 max-lg:top-full max-lg:w-full max-lg:flex-col max-lg:items-center max-lg:gap-4 max-lg:border-t max-lg:border-b max-lg:border-red-500 max-lg:bg-background max-lg:py-4 lg:flex',
      menuOpen ? 'flex' : 'hidden'
    )}
  >
    <NavigationMenu.Item>
      <NavigationMenu.Link href="#about" active={active === '#about'} onclick={selectSection('#about')} class={navLinkClass}>
        About
      </NavigationMenu.Link>
    </NavigationMenu.Item>
    <NavigationMenu.Item>
      <NavigationMenu.Link href="#libraries" active={active === '#libraries'} onclick={selectSection('#libraries')} class={navLinkClass}>
        Libraries
      </NavigationMenu.Link>
    </NavigationMenu.Item>
    <NavigationMenu.Item>
      <NavigationMenu.Link href="#projects" active={active === '#projects'} onclick={selectSection('#projects')} class={navLinkClass}>
        Projects
      </NavigationMenu.Link>
    </NavigationMenu.Item>
    <NavigationMenu.Item>
      <NavigationMenu.Link href="#contact" active={active === '#contact'} onclick={selectSection('#contact')} class={navLinkClass}>
        Contact
      </NavigationMenu.Link>
    </NavigationMenu.Item>
  </NavigationMenu.List>
  <ThemeToggle class="ml-auto" />
</NavigationMenu.Root>
