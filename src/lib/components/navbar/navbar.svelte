<script lang="ts">
  import * as NavigationMenu from '$lib/components/ui/navigation-menu/index.js';
  import * as Collapsible from '$lib/components/ui/collapsible/index.js';
  import ThemeToggle from './theme-toggle.svelte';
  import ColorPicker from './color-picker.svelte';
  import MenuToggle from './menu-toggle.svelte';
  import NavLinks from './nav-links.svelte';
  import { cn } from '$lib/utils.js';

  let active = $state('/');
  let menuOpen = $state(false);

  const navLinks = [
    { id: '#about', label: 'About' },
    { id: '#libraries', label: 'Libraries' },
    { id: '#projects', label: 'Projects' },
    { id: '#contact', label: 'Contact' }
  ];

  function selectSection(id: string) {
    return () => {
      active = id;
      menuOpen = false;
    };
  }
</script>

<NavigationMenu.Root
  class={cn(
    'relative z-10 max-w-full justify-start border-b border-(--accent-color) bg-background pt-4'
  )}
>
  <MenuToggle bind:open={menuOpen} class="lg:hidden" />

  <NavigationMenu.List
    class={cn(
      'max-lg:top max-lg:absolute max-lg:left-1/2 max-lg:-translate-x-1/2 max-lg:-translate-y-1/2'
    )}
  >
    <NavigationMenu.Item>
      <NavigationMenu.Link
        href="/"
        onclick={selectSection('#home')}
        class={cn('justify-center rounded-b-none font-extrabold', 'w-46 bg-(--accent-color)!')}
      >
        betosardinha.dev
      </NavigationMenu.Link>
    </NavigationMenu.Item>
  </NavigationMenu.List>

  <NavLinks links={navLinks} {active} onSelect={selectSection} class="hidden lg:flex" />

  <Collapsible.Root bind:open={menuOpen} class="absolute top-full left-0 w-full lg:hidden">
    <Collapsible.Content
      class={cn(
        'overflow-hidden bg-background',
        'data-[state=closed]:animate-collapsible-up data-[state=open]:animate-collapsible-down',
        'data-[state=open]:border-t data-[state=open]:border-b data-[state=open]:border-(--accent-color)'
      )}
    >
      <NavLinks
        links={navLinks}
        {active}
        onSelect={selectSection}
        class="flex-col items-center gap-4 py-4"
      />
    </Collapsible.Content>
  </Collapsible.Root>

  <div class="ml-auto flex items-center">
    <ColorPicker />
    <ThemeToggle />
  </div>
</NavigationMenu.Root>
